#!/usr/bin/env bash

tenant=${1:-demo_tenant}

load_sample_records() {
  endpoint=$1
  directory=$2

  for f in ./${directory}/*.json; do
    curl -v -w '\n' -X POST -D - \
         -H "Content-type: application/json" \
         -H "X-Okapi-Tenant: ${tenant}" \
         -d @$f \
         "${endpoint}"
  done
}

load_sample_records "http://localhost:9130/fiscal_year" "fiscal-years"
load_sample_records "http://localhost:9130/ledger" "ledgers"
load_sample_records "http://localhost:9130/fund" "funds"
load_sample_records "http://localhost:9130/budget" "budgets"
