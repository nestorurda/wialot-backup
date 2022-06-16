import consumer from "./consumer"

consumer.subscriptions.create("AppvarChannel", {
  connected() {
    console.log('conectado')
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    
    for (let i = 0; i < data.length; i++) {
      if(data[i].heartbeat == 0){
        $('#heartbeat-'+ data[i].id_device).removeClass('gray')
        $('#heartbeat-'+ data[i].id_device).addClass('red')
        $('#heartbeat-'+ data[i].id_device).removeClass('green')
      }else{
        $('#heartbeat-'+ data[i].id_device).removeClass('gray')
        $('#heartbeat-'+ data[i].id_device).addClass('green')
        $('#heartbeat-'+ data[i].id_device).removeClass('red')
      }      
    }  
    
    if (Object.keys(data).length == 8){
      $('#weight').html((parseFloat(data.weight)/1000).toString())
      $('#outletName').html(data.outlet_name)
      $('#outletProduct').html(data.product_name)
      $('#outletpacket').html(data.pack_name)
      $('#outletweight').html(data.pack_weight_kg)
    }

    if (Object.keys(data).length == 6){
      $('#temp').html(data.measure.toString())
      $('#location').html(data.location_site)
    }
    
    console.log(data);

    // Called when there's incoming data on the websocket for this channel
  }
});
