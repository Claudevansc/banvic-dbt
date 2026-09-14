with transacoes as (

    select
        cod_transacao,
        num_conta,
        data_transacao,
        nome_transacao,
        valor_transacao
    from {{ ref('stg_transacoes') }}

),

contas as (

    select
        num_conta,
        cod_cliente,
        cod_agencia,
        cod_colaborador,
        tipo_conta
    from {{ ref('stg_contas') }}

),

final as (

    select
        t.cod_transacao,
        t.data_transacao,
        c.cod_cliente,
        c.cod_agencia,
        c.cod_colaborador,
        t.num_conta,
        t.nome_transacao,
        t.valor_transacao

    from transacoes t
    left join contas c on t.num_conta = c.num_conta

)

select * from final