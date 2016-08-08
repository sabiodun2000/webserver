# Install and start Apache service
httpd_service 'testwebsite' do
    mpm 'prefork'
    action [:create, start]
end

# Add website configurarion file
httpd_config 'testwebsite' do
    instance 'testwebsite'
    source 'testwebsite.conf.erb'
    notifies :restart, 'httpd_service[testwebsite]'
end

# Add document root
directory '/var/www/testwebsite/public_html/index.html' do
    recursive true
end

# Write the homepage

#file '/var/www/testwebsite/public_html/index.html' do

file "#{node['dev_webserver']['document_root']}/index.html" do
    content '<html>
                <head>
                    <title>Hello World</title>
                </head>
                <body>
                    <h1>Hello World!</h1>
                </body>
            </html>'
    mode '0644'
    owner node['dev_webserver']['user']
    group node['dev_webserver']['group']

end


