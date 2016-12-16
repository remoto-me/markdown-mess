### Invoices

#### About Invoices

#### Schema



#### Fetch

> GET /v2/accounts/{ACCOUNT_ID}/invoices

```shell
curl -v -X GET \
    -H "X-Auth-Token: {AUTH_TOKEN}" \
    http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/invoices
```

#### Fetch

> GET /v2/accounts/{ACCOUNT_ID}/invoices/{INVOICE_ID}

```shell
curl -v -X GET \
    -H "X-Auth-Token: {AUTH_TOKEN}" \
    http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/invoices/{INVOICE_ID}
```

#### Fetch

> GET /v2/accounts/{ACCOUNT_ID}/invoices/{GUID}/{FORMAT}

```shell
curl -v -X GET \
    -H "X-Auth-Token: {AUTH_TOKEN}" \
    http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/invoices/{GUID}/{FORMAT}
```

#### Fetch

> GET /v2/accounts/{ACCOUNT_ID}/invoices/{INVOICE_ID}/call_records

```shell
curl -v -X GET \
    -H "X-Auth-Token: {AUTH_TOKEN}" \
    http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/invoices/{INVOICE_ID}/call_records
```

