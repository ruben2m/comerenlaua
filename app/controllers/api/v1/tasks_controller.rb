class Api::V1::TasksController < ApplicationController
  skip_before_filter :verify_authenticity_token,
    :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  #skip_before_filter :authenticate_user!

  respond_to :json

  def sube_foto
    directory = "public/menus"
    shop = current_user.shops.find(params[:shop])
    if shop
      # Si existe una foto de hoy, la borro
      hoy = Date.today
      photo = Photo.find_by_date(hoy)
      if photo
        path = File.join(directory, photo.file)
        File.delete(path)
        photo.delete
      end

      # Creo nueva foto
      file_name = hoy.strftime("%Y%m%d")+"_"+shop.id.to_s+".jpg"
      photo = shop.photos.create(date: hoy, file: file_name)

      path = File.join(directory, file_name)
      File.open(path, "wb") { |f| f.write(params[:file]) }

      # Hago copia thumbnail
      path = File.join(directory, file_name)
      path_thumb = File.join(directory, "thumb"+file_name)
      Image.resize(path, path_thumb, 220, 220)

      render :text => '{ "success":true, "info":"ok" }'
    else
      render :text => '{ "success":false, "info":"No existe tienda" }'
    end

  end

  def descarga_foto
    shop = current_user.shops.find(params[:shop])
    if shop
      # si hoy no hay foto, devolvemos null
      hoy = Date.today
      photo = Photo.find_by_date(hoy)
      if photo
        path = File.join("public/menus", photo.file)
        data = Base64.encode64(File.read(path)).gsub("\n", '')
        render :text => '{ "success":true, "data":"'+data+'" }'
      else
        render :text => '{ "success":true, "data":"nofoto" }'
      end
    else
      render :text => '{ "success":false, "info":"No existe tienda" }'
    end
  end
end
