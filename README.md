# Terraform AWS Infrastructure

Este repositório contém configurações Terraform para provisionamento de infraestrutura na AWS. O objetivo deste projeto é fornecer uma base sólida para a criação e gestão de recursos AWS usando Terraform.

## Estrutura do Repositório

O repositório é organizado da seguinte forma:

- **certificados.tf**: Configurações para gerenciamento de certificados.
- **ecr.tf**: Configurações para Amazon Elastic Container Registry (ECR).
- **gateway.tf**: Configurações para gateways (por exemplo, Internet Gateway).
- **instances.tf**: Configurações para instâncias EC2.
- **key-pair.tf**: Configurações para pares de chaves.
- **load-balancers.tf**: Configurações para Load Balancers.
- **locals.tf**: Definição de variáveis locais usadas em outros arquivos.
- **main.tf**: Arquivo principal que chama outros módulos e configurações.
- **network.tf**: Configurações para redes, incluindo VPCs e sub-redes.
- **route53.tf**: Configurações para o serviço Route 53.
- **routes.tf**: Configurações para rotas e tabelas de rotas.
- **security_groups.tf**: Configurações para grupos de segurança.
- **target-groups.tf**: Configurações para grupos de destino.
- **vars.tf**: Definição de variáveis usadas na configuração.
- **vpc.tf**: Configurações para Virtual Private Cloud (VPC).

## Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) instalado
- Conta AWS com permissões apropriadas para criar e gerenciar recursos

## Configuração

1. Clone o repositório:

    ```bash
    git clone https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
    cd SEU_REPOSITORIO
    ```

2. Configure suas credenciais AWS:

    ```bash
    export AWS_ACCESS_KEY_ID=SEU_ID
    export AWS_SECRET_ACCESS_KEY=SUA_CHAVE
    ```

3. Inicialize o Terraform:

    ```bash
    terraform init
    ```

4. Valide a configuração:

    ```bash
    terraform validate
    ```

5. Aplique a configuração:

    ```bash
    terraform apply
    ```

## Contribuição

Sinta-se à vontade para contribuir com o projeto! Por favor, siga o fluxo de trabalho padrão de pull requests e certifique-se de testar suas alterações.

## Contato

Para dúvidas e sugestões, entre em contato com [adissonv@gmail.com](mailto:adissonv@gmail.com).
