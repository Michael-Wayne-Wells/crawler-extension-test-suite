
#!/bin/bash
if [ -z "$1" ] || [ "$1" = build ]; then
    echo "building test environment"
    if [ -z "$2" ]; then
        docker-compose -f docker-compose-extension.yml build --no-cache &&
        docker-compose -f docker-compose-extension.yml run --rm tilig-api bundle install 
    fi    
    if [ "$2" = extension ]; then
        docker-compose -f docker-compose-extension.yml build extension 
    fi    
        docker-compose -f docker-compose-extension.yml run --rm extension yarn build --no-cache &&
        docker-compose -f docker-compose-extension.yml run --rm crxmake crxmake ./dist ./dist.pem ./crx_build/dist.crx
fi


if [ "$1" != build ]; then
    docker-compose -f docker-compose-extension.yml run --rm tilig-api rails db:reset &&
    docker-compose -f docker-compose-extension.yml up -d &&

    if [ "$1" = autofill ]; then
        echo "Testing autofill feature"
        docker-compose -f docker-compose-extension.yml run --rm feature ruby login.rb &&
        docker-compose -f docker-compose-extension.yml run --rm tilig-api rails db:seed &&
        docker-compose -f docker-compose-extension.yml run --rm feature rspec ./spec/features/autofill_spec.rb --format documentation 
    elif [ "$1" = quick ]; then
        echo "Performing quick scan"
        docker-compose -f docker-compose-extension.yml run --rm feature rspec ./spec/features/quick_spec.rb --format documentation 
    elif [ "$1" = login ]; then
        echo "Testing login page feature"
        docker-compose -f docker-compose-extension.yml run --rm feature rspec ./spec/features/login_spec.rb --format documentation 
    else
        docker-compose -f docker-compose-extension.yml run --rm feature rspec ./spec/features/quick_spec.rb ./spec/features/login_spec.rb --format documentation
        docker-compose -f docker-compose-extension.yml run --rm feature ruby login.rb &&
        docker-compose -f docker-compose-extension.yml run --rm tilig-api rails db:seed &&
        docker-compose -f docker-compose-extension.yml run --rm feature rspec ./spec/features/autofill_spec.rb --format documentation 
    fi

    docker-compose -f docker-compose-extension.yml down --remove-orphans
fi

