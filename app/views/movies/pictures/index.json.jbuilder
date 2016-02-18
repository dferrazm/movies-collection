json.array! @pictures do |picture|
  json.partial! 'picture', picture: picture
end
