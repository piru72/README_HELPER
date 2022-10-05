class Image
  attr_accessor :name, :link

  def initialize(name, link)
    @name = name
    @link = link
  end
end

def read_image(file)
  name = file.gets.chomp.to_s
  link = "<img src=\"https://raw.githubusercontent.com/piru72/Uni_buddy/master/Screenshots/" + name + "  " + "height=\"600\">"
  image = Image.new(name, link)
  return image
end

def read_images()
  image_file = File.new("imageNames.txt", "r")

  number_of_lines = File.foreach(image_file).count

  images = Array.new()

  while (number_of_lines > 0)
    image = read_image(image_file)
    images << image
    number_of_lines -= 1
  end

  image_file.close

  return images
end

def print_images(imageList)
  forGithubImages = File.new("forGithubImage.txt", "w")

  i = 0
  while (i < imageList.size)
    
    forGithubImages.puts imageList[i].link
    
    i += 1
  end
end

def main()
  imageList = read_images()
  puts imageList.size
  print_images(imageList)
end

main()


