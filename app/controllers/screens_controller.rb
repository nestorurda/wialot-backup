class ScreensController < ApplicationController
  layout 'admin'
  def configInit
    ip = request.remote_ip 
    if Screen.find_by(ip:ip).present?
      ip = Screen.find_by(ip:ip)
      redirect_to "/screens/show/#{ip.screen_channel}"
    else
      if Screen.maximum("screen_channel") == nil
        screen = 1
        Screen.create(ip:ip,screen_channel:screen)
        Screen.find_by(ip:ip).present?
        ip = Screen.find_by(ip:ip)
        redirect_to "/screens/show/#{ip.screen_channel}"
      else
        screen = Screen.maximum("screen_channel")
        screen = screen + 1
        Screen.create(ip:ip,screen_channel:screen)
        Screen.find_by(ip:ip).present?
        ip = Screen.find_by(ip:ip)
        redirect_to "/screens/show/#{ip.screen_channel}"
      end
    end
  end

 def show
    @screen_id = params[:id]
    @info_outlet = Outlet.all
    @screenInfo = Screen.where(screen_channel:params[:id])
  end

  def update 
    # los canales son creados dependiendo de la cantidad de dispositivos
    # siempre vamos a tener 4 pantallas 
    # el broadcast debe ser dirigido por dispositivo, canal y pantallas
    screen_info = Screen.all
    screen_info.each do |screen| 
      out0 = Outlet.where(id_outlet_sz:screen.outlets_id_0)
      ActionCable.server.broadcast "screen_channel_#{screen.screen_channel}",
          {divPantalla:0,
          noutlet:out0[0].id_outlet_sz,
          nameoutlet:out0[0].outlet_name,
          desoutlet:out0[0].product_name,
          poutlet:out0[0].pack_name,
          toutlet:out0[0].pack_weight_kg}
      out1 = Outlet.where(id_outlet_sz:screen.outlets_id_1)
      ActionCable.server.broadcast "screen_channel_#{screen.screen_channel}",
          {divPantalla:1,
          noutlet:out1[0].id_outlet_sz,
          nameoutlet:out1[0].outlet_name,
          desoutlet:out1[0].product_name,
          poutlet:out1[0].pack_name,
          toutlet:out1[0].pack_weight_kg}
      out2 = Outlet.where(id_outlet_sz:screen.outlets_id_2)
      ActionCable.server.broadcast "screen_channel_#{screen.screen_channel}",
          {divPantalla:2,
          noutlet:out2[0].id_outlet_sz,
          nameoutlet:out2[0].outlet_name,
          desoutlet:out2[0].product_name,
          poutlet:out2[0].pack_name,
          toutlet:out2[0].pack_weight_kg}
      out3 = Outlet.where(id_outlet_sz:screen.outlets_id_3)
      ActionCable.server.broadcast "screen_channel_#{screen.screen_channel}",
          {divPantalla:3,
          noutlet:out3[0].id_outlet_sz,
          nameoutlet:out3[0].outlet_name,
          desoutlet:out3[0].product_name,
          poutlet:out3[0].pack_name,
          toutlet:out3[0].pack_weight_kg}
    end    
      respond_to do |format|
        format.html
        format.json { render json: {message:"update ready"} }
      end

    end

    def index
      @out = Outlet.all
      @devices = Screen.all
    end
  
    def open_modal
      @device = Screen.find(params[:id])
      respond_to do |format|
        format.js
      end
    
    end

    def open_modal_back
      @device = Screen.find(params[:id])
      respond_to do |format|
        format.js
      end
    end
  
    def open_modal_update
      @devices = Screen.all
      change_device = Screen.find(modal_params[:id])
      change_device.update(modal_params)
      ActionCable.server.broadcast "screen_channel_#{modal_params[:screen_channel]}",
      {refresh:1}
      ActionCable.server.broadcast "screen_channel_1000",
      {send_to_nodered:'screen_update_change'}
       respond_to do |format|
       format.js
       end
     end
    

    def modal_params
      params.require(:screen).permit(:id,:ip, :screen_channel, :cant_screen, :outlets_id_0, :outlets_id_1, :outlets_id_2, :outlets_id_3,:background)
    end
    
  end
    