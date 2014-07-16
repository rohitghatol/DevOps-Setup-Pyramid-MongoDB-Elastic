class pyramid::params
{
  $python_package_name = hiera(python_package_name)
  $easy_install_download_url = hiera(easy_install_download_url)
  $easy_install_file_name = hiera(easy_install_file_name)
}


