#!/usr/bin/env ruby

require 'csv'
require 'pp'

CSV::Converters[:ing_date] = ->(s) {
  begin
    Date.strptime(s, "%Y%m%d")
  rescue ArgumentError
    s
  end
}

source_csv = CSV.read(
  ARGV[0],
  headers: true,
  converters: [:ing_date, :float],
  header_converters: [:downcase, :symbol],
)

puts(
  CSV.generate do |csv|
    csv << ['date', 'payee', 'memo', 'inflow', 'outflow']

    source_csv.each do |row|
      amount = row[:bedrag_eur].sub(',', '.').to_f
      inflow, outflow = if row[:af_bij] == 'Af'
                          [0, amount]
                        else
                          [amount, 0]
                        end

      csv << [
        row[:datum].iso8601,
        row[:naam__omschrijving],
        row[:mededelingen],
        inflow,
        outflow,
      ]
    end
  end
)
