module 0x0::simple_contract {

    const NOT_AUTHORIZED: u64 = 0;
    public struct SuiHubAfricaToken has key, store{
        id: UID,
        name: vector<u8>,
        description: std::string::String,
        url: sui::url::Url
    }

    public struct TransferEvent has drop, copy {
        description: std::string::String,
        to: address,
        from: address,
        // amoun
        timestamp: u64
    }

    public entry fun  mint_nft(
        name: vector<u8>, 
        description: std::string::String, 
        image_link: std::string::String,
        ctx: &mut TxContext
        ){

            let i = SuiHubAfricaToken {
                id: object::new(ctx),
                name,
                description,
                url: sui::url::new_unsafe(image_link.to_ascii()),
            };
            transfer::public_transfer(i, ctx.sender())
    }

    /*
    this should transfer the nft to another address
    */
    public entry fun transfer_nft(
        sender: address,
        recipient: address,
        nft: SuiHubAfricaToken,
        ctx: &mut TxContext
    ): TransferEvent
    {
        assert!(ctx.sender() == sender, NOT_AUTHORIZED);
        transfer::public_transfer(nft, recipient);
        TransferEvent {
            description: b"Hey! a transfer just occured".to_string(),
            to: recipient,
            from: sender,
            timestamp: ctx.epoch_timestamp_ms(),
        }
        
    }


    public entry fun burn_nft(
        nft: SuiHubAfricaToken,
        ctx: &mut TxContext,
    ): TransferEvent
    {
        let SuiHubAfricaToken{
            id: id,
            name: _,
            description: _,
            url: _ 
        } = nft;
        object::delete(id);
        TransferEvent {
            description: b"Hey! a transfer just occured".to_string(),
            to: @0x1,
            from: @0x2,
            timestamp: ctx.epoch_timestamp_ms(),
        }
    }

    
}