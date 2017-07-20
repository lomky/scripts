require 'csv'

def main
  entries = CSV.read(ARGV.first, headers: true, encoding: "BOM|UTF-8").map do |row|
    ledger_entry(row)
  end

  File.open("ynab_ledger.dat", "w") do |f|
    f.puts entries.compact.reverse.join("\n")
  end
end

def ledger_entry(row)
  inflow = row["AmountA"]
  outflow = row["AmountB"]

  return if inflow == "" && outflow == ""

  month, day, year = row["Date"].split("/")

  source = row["AccountA"]

  return if source == ""
  return if source == nil

  account = row["AccountB"]

  <<END
#{year}/#{month}/#{day} * "#{row["Payee"]}" "#{row["Memo"]}"
    #{source}             #{outflow} USD
    #{account}            #{inflow} USD
END
end

def blank_if_zero(amount)
  amount == "$0.00" ? "" : amount
end

main if __FILE__ == $0
