import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {

  const screen_id = $('#screen_id').attr('data-screen-id');


  consumer.subscriptions.create({ channel: "ScreenChannel", screen_id: screen_id }, {
    connected() {
      console.log('Connected to room channel: ' + screen_id)
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      //console.log(data)
      // Called when there's incoming data on the websocket for this channel
      //console.log(data.info_pantalla[0].divPantalla)
      for (let index = 0; index < data.length; index++) {
      //console.log(data[index].outlet_fpm)
      $('#info-screen-n-outlets-' + data[index].divPantalla).html(data[index].noutlet);
      $('#info-screen-name-outlet-' + data[index].divPantalla).html(data[index].nameoutlet);
      $('#info-screen-desc-outlet-' + data[index].divPantalla).html(data[index].desoutlet);
      $('#info-screen-type-package-outlet-' + data[index].divPantalla).html(data[index].poutlet);
      $('#info-screen-target-outlet-' + data[index].divPantalla).html(data[index].toutlet);
      $('#info-screen-status-' + data[index].divPantalla).html(data[index].outlet_status);
      $('#info-screen-fpm-' + data[index].divPantalla).html(data[index].outlet_fpm);
      $('#info-screen-fpm-' + data[index].divPantalla).addClass('color-update'); 
      setTimeout(changeFpm, 2000);
      

      function changeFpm(){
        $('#info-screen-fpm-' + data[index].divPantalla).removeClass('color-update'); 
      }
      }
     
     

      if (data.refresh == 1){
       location.reload();
       //console.log('hay que refrescar')
      }else{
        //console.log('no hay que refrescar')
      }
    }
  });

});


