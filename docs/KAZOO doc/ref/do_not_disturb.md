### Do_not_disturb

#### About Do_not_disturb

#### Schema



#### Fetch

> GET /v2/accounts/{ACCOUNT_ID}/do_not_disturb/{ENDPOINT_ID}

```shell
curl -v -X GET \
    -H "X-Auth-Token: {AUTH_TOKEN}" \
    http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/do_not_disturb/{ENDPOINT_ID}
```

#### Change

> POST /v2/accounts/{ACCOUNT_ID}/do_not_disturb/{ENDPOINT_ID}/{DND_ON}

```shell
curl -v -X POST \
    -H "X-Auth-Token: {AUTH_TOKEN}" \
    http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/do_not_disturb/{ENDPOINT_ID}/{DND_ON}
```

