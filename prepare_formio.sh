!#/bin/bash
cd tmp
curl https://codeload.github.com/formio/formio/zip/master -o formio-server.zip
curl https://codeload.github.com/formio/formio-app-formio/zip/master -o formio-client.zip

unzip formio-server.zip -d ./
mv formio-master formio-app
unzip formio-client.zip
mv formio-app-formio-master client
cp ../assets/client/config.js client/dist/
mv client formio-app/
cd formio-app
tar -cvf app.tar config/ src/ test/ client/ *.js .bithoundrc .eslintignore .eslintrc .npmignore package.json logo.txt welcome.txt
gzip app.tar
mv app.tar.gz ../../
cd ..

cd ..

