# lets-encrypt-regru

https://www.reg.ru hook for https://github.com/lukas2511/dehydrated 

Install deps 

```$ gem install reg.api2```

Set reg.ru user and password in lets-encrypt-regru.rb

Download dehydrated and use like this:

```./dehydrated --cron --domain my.domain.example.com --hook ./lets-encrypt-regru.rb --challenge dns-01```


