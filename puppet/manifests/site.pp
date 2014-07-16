node webserver{
  include pyramid
}


node db{
  include java
  include mongodb
  include elasticsearch
}


