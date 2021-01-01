# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


aggregate1 = Aggregate.create!(name: 'Revenue')
aggregate2 = Aggregate.create!(name: 'COGS')
aggregate3 = Aggregate.create!(name: 'Fees')
aggregate4 = Aggregate.create!(name: 'Cash')
aggregate5 = Aggregate.create!(name: 'Trade receivables')

AccountingLine.create!(aggregate: aggregate1, account_number: '701', description: 'Client Neoen', debit: 0, credit: 100)
AccountingLine.create!(aggregate: aggregate1, account_number: '701', description: 'Client Shipup', debit: 0, credit: 150)
AccountingLine.create!(aggregate: aggregate1, account_number: '701', description: 'Client Karhoo', debit: 0, credit: 165)
AccountingLine.create!(aggregate: aggregate2, account_number: '601', description: 'Supplier A', debit: 65, credit: 0)
AccountingLine.create!(aggregate: aggregate2, account_number: '601', description: 'Supplier B', debit: 12, credit: 0)
AccountingLine.create!(aggregate: aggregate2, account_number: '601', description: 'Supplier C', debit: 5, credit: 0)
AccountingLine.create!(aggregate: aggregate3, account_number: '622', description: 'EY', debit: 50, credit: 0)
AccountingLine.create!(aggregate: aggregate3, account_number: '622', description: 'McKinsey', debit: 23, credit: 0)
AccountingLine.create!(aggregate: aggregate3, account_number: '622', description: 'BCG', debit: 12, credit: 0)
AccountingLine.create!(aggregate: aggregate4, account_number: '512', description: '12/11/20 payment', debit: 30, credit: 0)
AccountingLine.create!(aggregate: aggregate4, account_number: '512', description: '14/11/20 payment', debit: 43, credit: 0)
AccountingLine.create!(aggregate: aggregate4, account_number: '512', description: '12/10/20 payment', debit: 16, credit: 0)
AccountingLine.create!(aggregate: aggregate5, account_number: '411', description: 'Neoen', debit: 20, credit: 0)
AccountingLine.create!(aggregate: aggregate5, account_number: '411', description: 'Shipup', debit: 12, credit: 0)
AccountingLine.create!(aggregate: aggregate5, account_number: '411', description: 'Karhoo', debit: 18, credit: 0)