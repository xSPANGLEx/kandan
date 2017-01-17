class AvatarController < ApplicationController
  def upload
    file = params[:upfile]
    name = params[:id]
    filename = file.original_filename

    if !['.png'].include?(File.extname(filename).downcase)
      msg = "error"
      render :text => msg
    else
      File.open("public/assets/avatar/#{name}.png", 'wb') { |f| f.write(file.read) }
      redirect_to :back
    end
  end

  def download
    id = params[:id]
    if File.exist?("public/assets/avatar/#{id}.png")
      file_path = File.join(Rails.root,"public/assets/avatar/","#{id}.png")
      send_file(file_path,filename: "#{id}.png")
    else
      file_path = File.join(Rails.root,"public/assets/avatar/","undefined.png")
      send_file(file_path,filename: "undefined.png")
    end
  end

  def edit
    id = params[:id]
    @action_url = "/avatar_image/upload/#{id}"
  end

end
