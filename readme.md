# VPC Infraestrutura Terraform

Este repositório fornece a infraestrutura básica para criar uma **VPC** com sub-redes públicas e privadas na AWS usando o Terraform. O módulo pode ser facilmente integrado ao seu projeto Terraform para provisionar uma VPC com as configurações necessárias.

## Como usar o módulo

Para utilizar este módulo em seu projeto Terraform, siga os passos abaixo:

### Passo 1: Configuração do Provider

Primeiro, você precisa configurar o provider AWS no seu projeto Terraform. Adicione a configuração do provider no arquivo Terraform (por exemplo, `main.tf`):

```hcl
provider "aws" { 
  region = "us-east-1"  # Substitua pela região desejada, por exemplo, "us-west-2"
}
```

### Passo 2: Chamada do Módulo

Em seguida, chame o módulo para criar a VPC e as sub-redes. Adicione a seguinte configuração ao seu arquivo Terraform:

```hcl
module "vpc" {
  source = "github.com/fiap-postech-36/vpc-infrastructure?ref=1.0.0"  # Chama o módulo VPC do repositório

  name                = "my-vpc"                # Nome da sua VPC
  vpc_cidr            = "10.0.0.0/16"           # CIDR da VPC
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]  # CIDR das sub-redes públicas
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"] # CIDR das sub-redes privadas
}
```


### Explicação dos Parâmetros

#### `name` (obrigatório)
- **Descrição**: Nome da sua VPC. Esse valor será usado para criar a VPC e as outras dependências de rede.
- **Exemplo**: `"my-vpc"`

#### `vpc_cidr` (obrigatório)
- **Descrição**: CIDR que define o bloco de IPs para a VPC. Deve ser um bloco de IP privado. Este é o espaço de endereçamento para a sua VPC.
- **Exemplo**: `"10.0.0.0/16"` (cria um intervalo de IPs de 10.0.0.0 até 10.0.255.255)

#### `public_subnet_cidrs` (obrigatório)
- **Descrição**: Lista de blocos CIDR para as sub-redes públicas. As sub-redes públicas geralmente têm uma rota para a internet através de um **Internet Gateway**.
- **Exemplo**: `["10.0.1.0/24", "10.0.2.0/24"]`

#### `private_subnet_cidrs` (obrigatório)
- **Descrição**: Lista de blocos CIDR para as sub-redes privadas. As sub-redes privadas não têm acesso direto à internet, mas podem acessar a internet através de um **NAT Gateway** (opcional).
- **Exemplo**: `["10.0.3.0/24", "10.0.4.0/24"]`


---

## O que é criado pelo módulo

Ao executar o módulo, ele criará os seguintes recursos:

- **VPC**: A VPC com o CIDR definido.
- **Sub-redes públicas**: As sub-redes públicas especificadas.
- **Sub-redes privadas**: As sub-redes privadas especificadas.
- **Internet Gateway**: Para fornecer acesso à internet para as sub-redes públicas.
- **Rota de Internet**: Para as sub-redes públicas.


---

## Considerações

- Certifique-se de ajustar os valores de CIDR de acordo com as necessidades do seu projeto.
- O módulo cria apenas os recursos básicos de rede (VPC, sub-redes e gateways). Outros recursos, como instâncias EC2, RDS, etc., precisam ser configurados separadamente.