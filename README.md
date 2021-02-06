Ruby server timeout 確認
===



```
# webrick
RACK_ENV=production bundle exec rackup -s webrick -p 8000

# puma
RACK_ENV=production bundle exec rackup -s puma -p 8000

# unicorn
RACK_ENV=production bundle exec unicorn -p 8000

# thin
RACK_ENV=production bundle exec rackup -s thin -p 8000

# falcon
RACK_ENV=production bundle exec rackup -s # falcon -p 8000

# passenger
RACK_ENV=production bundle exec passenger start -p 8000
```


```
curl http://127.0.0.1:8000/sleep
```