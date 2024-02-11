def encontrar_menor_numero(vetor)
    vetor.min
end

def encontrar_maior_numero(vetor)
    vetor.max
end

def encontrar_progressao_aritmetica(vetor)
    vetor.sort!
    diferenca = vetor[1] - vetor[0]
    for i in 1..vetor.size-1
        if vetor[i] - vetor[i-1] != diferenca
            return false
        end
    end
    return true
end

def validar_entrada(valores_de_entrada)
    if valores_de_entrada.empty?
        puts "Erro: Nenhum número foi inserido."
        return false
    end

    vetor = valores_de_entrada.split(" ").map do |valor|
        if valor.match?(/\D/)
            puts "Erro: '#{valor}' não é um número válido."
            return false
        end
        valor.to_i
    end

    return vetor
end

# solicita ao usuário que digite os números e armazena-os em um vetor
puts "Digite os números separados por espaço:"
valores_de_entrada = gets.chomp
vetor = validar_entrada(valores_de_entrada)

if vetor
    # Encontrar o maior e o menor número
    puts "Maior número: #{encontrar_maior_numero(vetor)}"
    puts "Menor número: #{encontrar_menor_numero(vetor)}"

    # Verificar se é uma progressão aritmética
    is_progressao_aritmetica = encontrar_progressao_aritmetica(vetor)
    if is_progressao_aritmetica
        puts "É uma progressão aritmética"
        puts vetor.join("->")
    else
        puts "Não é uma progressão aritmética"
    end
else
    puts "Por favor, corrija os erros e tente novamente."
end
