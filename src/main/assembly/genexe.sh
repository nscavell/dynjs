#!/bin/sh
if [ ! -d "bin" ] 
then
  mkdir -v "bin"
fi
if [ -f "bin/dynjs" ] 
then 
  echo "Removing old dynjs executable"
  rm -f "bin/dynjs"
fi
echo "Creating dynjs executable"
ARGS='"$@"'
(echo "#!/bin/sh\nexec java -jar \$0 $ARGS\n"; cat target/dynjs-all.jar) > bin/dynjs && chmod +x bin/dynjs
