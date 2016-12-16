### Braintree

#### About Braintree

#### Schema



#### Fetch

> GET /v2/accounts/{ACCOUNT_ID}/braintree/cards

```shell
curl -v -X GET \
    -H "X-Auth-Token: {AUTH_TOKEN}" \
    http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/braintree/cards
```

#### Create

> PUT /v2/accounts/{ACCOUNT_ID}/braintree/cards

```shell
curl -v -X PUT \
    -H "X-Auth-Token: {AUTH_TOKEN}" \
    http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/braintree/cards
```

#### Remove

> DELETE /v2/accounts/{ACCOUNT_ID}/braintree/cards/{CARD_ID}

```shell
curl -v -X DELETE \
    -H "X-Auth-Token: {AUTH_TOKEN}" \
    http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/braintree/cards/{CARD_ID}
```

