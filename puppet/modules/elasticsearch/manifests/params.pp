class elasticsearch::params
{
  $elasticsearch_download_url = hiera(elasticsearch_download_url)
  $elasticsearch_deb_file_name = hiera(elasticsearch_deb_file_name)
}

