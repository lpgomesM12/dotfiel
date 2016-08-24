json.array!(@premios) do |result|
json.id result.id
json.value result.nome_premio + " > "  + result.numr_ponto.to_s + "Pts "
json.numr_ponto result.numr_ponto
end
