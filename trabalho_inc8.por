programa
{
	const inteiro contador_funcionarios = 5 // Muda a quanita de funcionários no código todo
	
	cadeia nome[contador_funcionarios] 
	inteiro idade[contador_funcionarios]
	caracter sexo[contador_funcionarios]
	real salario[contador_funcionarios]
	
	funcao leia_dados(inteiro a) { 
		
		escreva("Digite o nome.\n")
		leia(nome[a])
		escreva("Digite a idade.\n")
		leia(idade[a])
		enquanto(idade[a] < 0) {
			escreva("Digite a Idade novamente.\n")
			leia(idade[a])
		}
		escreva("Digite o sexo (M ou F).\n")
		leia(sexo[a])
		enquanto(sexo[a] != 'm' e sexo[a] != 'M' e sexo[a] != 'F' e sexo[a] != 'f') {
			escreva("Digite o Sexo novamente.\n")
			leia(sexo[a])	
		}
		escreva("Digite o salário.\n")
		leia(salario[a])
		enquanto(salario[a] < 0) {
			escreva("Digite o Salário novamente.\n")
			leia(salario[a])
		}
	}

	funcao atualizar_dados(inteiro a) {
		inteiro escolher
		escreva("O nome atual do usúario do slot " + a + " é " +  nome[a] + ".\n")
		escreva("Você deseja atualizar somente uma informação ou todas?\n")
		escreva("0. Apenas uma\n1. Todas\n") 
		leia(escolher)
		se(escolher == 0) {
			escreva("O que você deseja atualizar desse funcionário?\n0. Nome\n1. Idade\n2. Sexo\n3. Salário.\n") 
			leia(escolher)
			escolha(escolher) {
				caso 0:
					escreva("Digite um novo Nome. O Atual é " + nome[a] + "\n")
					leia(nome[a])		
					pare
				
				caso 1:
					escreva("Digite uma nova idade. A Atual é " + idade[a] + "\n")
					leia(idade[a])
					pare
						
				caso 2:
					escreva("Digite um nova sexo. O Atual é " + sexo[a] + "\n")
					leia(sexo[a])
					pare
						
				caso 3:
					escreva("Digite um novo salário. O Atual é " + salario[a] + "\n")
					leia(salario[a])
					pare	
				}
		}senao {
			leia_dados(a)
		}
		
	}

	funcao deletar_dados(inteiro a) {
		escolha(a) {
			caso a:
				escreva("Os dados do(a) " + nome[a] + " foram deletados\n")
				nome[a] = ""
				idade[a] = 0
				sexo[a] = '.'
				salario[a] = 0.0
				pare
		}
	}

	funcao listar_dados() {
		para(inteiro x = 0; x < contador_funcionarios; x++) {
			se(nome[x] == "") {
			escreva("O slot " + x +  " está vazio!\n")
			}senao {
				escreva("Slot " + x + ", Nome: " + nome[x] + ", Idade: " + idade[x] + ", Sexo: " + sexo[x] + ", Salário: " + salario[x] + "\n")	
			}		
		}
	}

	funcao calcula_media_salarial() {
		inteiro soma = 0, contador = 0, soma_2 = 0, contador_2 = 0
		real salario_1 = 0.0, salario_2 = 0.0
		real media = 0.0
		para(inteiro i = 0; i < contador_funcionarios; i++) {
			se(sexo[i] == 'F' ou sexo[i] == 'f') {
				soma = soma + idade[i]
				contador++
				salario_1 = salario_1 + salario[i]
			}senao se(sexo[i] == 'M' ou sexo[i] == 'm') {
				soma_2 = soma_2 + idade[i]
				contador_2++
				salario_2 = salario_2 + salario[i]
			}
		}
		se(contador_2 == 0) {
			escreva("Nenhum relatório Masculino a ser apresentado\n")
		}senao {
			escreva("A Média de idades Masculina é de ", soma_2 / contador_2, "\n")
			escreva("A Média salárial Masculina é de R$ ", salario_2 / contador_2, "\n")
		}

		se(contador == 0) {
			escreva("Nenhum relatório Feminino a ser apresentado\n")
		}senao {
			escreva("A Média de idades Feminina é de ", soma / contador, "\n")
			escreva("A Média salárial Feminina é de R$ ", salario_1 / contador, "\n")	
		}

	}

	funcao pessoa_jovem_e_maior_salario() {
		real maior_salario = salario[0]
		cadeia maior_nome = nome[0], mais_jovem = nome[0]
		inteiro y = 0, menor_idade = idade[0]
		maior_salario = salario[0]
		enquanto(y < contador_funcionarios) {
			se(salario[y] > maior_salario) {
				maior_salario = salario[y]
				maior_nome = nome[y]
			}
			se(idade[y] < menor_idade) {
				se(idade[y] == 0) {
					pare
				}
				menor_idade = idade[y]
				mais_jovem = nome[y]
			}
			
			y++
		}
		se(maior_salario == 0.0) {
			escreva("Nenhum Salário Disponível.\n")
		}senao {
			escreva("O maior salário é do " + maior_nome + ", com o valor de R$" + maior_salario + ".\n")
		}

		se(menor_idade == 0) {
			escreva("Nenhuma Idade Salva.\n")
		}senao {
			escreva("A pessoa mais jovem é a(o) " + mais_jovem + ", com idade de " + menor_idade + " anos.\n")
		}
	}
		
	funcao inicio()
	{
		inteiro escolher, y = 0


		para(inteiro i = 1; i != 0; i++) {
			escreva("O que deseja fazer? \n\n")
			escreva("1. Inserir Dados; 2. Atualizar Dados\n3. Deletar Dados; 4. Listar Dados\n5. Relatórios; 6. Sair\n")
			leia(escolher)
			enquanto(escolher > 6 ou escolher < 0) {
				escreva("Digite um número válido.\n")
					leia(escolher)
			}
			
			escolha(escolher) { //usuario deve digitar os dados de entrada
				caso 1:
					enquanto(y < contador_funcionarios) {
						se(nome[y] == "") {
							leia_dados(y)
							pare
						}
					y++
					}
					
					se(y >= contador_funcionarios) { //Não poderá ter mais usuarios
						escreva("Limite de Usuários Atingido! ")
					}
					pare
					
				caso 2:
					se(nome[0] == "" e nome[1] == "") {
						escreva("Não existem usúarios a serem atualizados. ")
						pare
					}
					escreva("Digite o número do funcionário que você deseja atualizar. \n")
					para(inteiro c = 0; c < contador_funcionarios; c++) {
						se(nome[c] == "") {
							
						}senao {
							escreva(c + ". " + nome[c] + "; \n")
						}
					}
					logico verifica = verdadeiro
					enquanto (verifica) {
						leia(escolher)
						se(escolher >= 5 ou nome[escolher] == "") {
							escreva("Vazio, escolha denovo.\n")		
						}senao {
							atualizar_dados(escolher)							
							verifica = falso
						}
					}
					pare
				caso 3:
					se(nome[0] == "" e nome[1] == "") {
						escreva("Não existem usúarios a serem deletados. ")
						pare
					}
					escreva("Digite o número do funcionário que você deseja deletar\n")
					para(inteiro c = 0; c < contador_funcionarios; c++) {
						se(nome[c] == "") {
							
						}senao {
							escreva(c + ". " + nome[c] + "; ")
						}
					}
					//escreva(nome[0] + " " + nome[1])
					logico verifica_2 = verdadeiro 
					enquanto (verifica_2) {
						leia(escolher)
						se(escolher >= contador_funcionarios ou nome[escolher] == "") {
							escreva("Vazio, escolha denovo.\n")		
						}senao {
							deletar_dados(escolher)
							y = 0
							verifica_2 = falso 
						}
					}
					pare
				caso 4:
					listar_dados()
					pare
				caso 5:
					escreva("O que deseja fazer?\n")
					escreva("0. Ver as médias de idade e salários.\n1. Ver a pessoa mais jovem e a pessoa com maior salário.\n")
					leia(escolher)
					enquanto(escolher > 1) {
						escreva("Digite Novamente.\n")
						leia(escolher)
					}
					se(escolher == 0) {
						calcula_media_salarial()
					}senao {
						pessoa_jovem_e_maior_salario()
					}
			}
			se(escolher == 6) {
				escreva("Saindo.")
				pare
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2121; 
 * @DOBRAMENTO-CODIGO = [9, 33, 69, 106, 91, 122];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */