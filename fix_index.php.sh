if [ "$1" ];then
    share="$1"
else
   share=$(git log | grep share: | awk -F":" '{print $2}' | head -n1)
fi
cat <<EOF > index.php
<center>
<h1>Nuevos Caminos por Antioquia</h1>
Haga click sobre el icono <img src="iconob.png" alt="Abrir in wikiloc" height="30"> para abrir la ruta en <a href="http://www.wikiloc.com/">wikiloc</a> (<a href="http://geojson.io/#id=github:rescolo/ncxa/blob/master/NCXA.geojson&map=10/6.1610/-75.1808"> Edit<a/>) [<a href="https://www.google.com/maps/d/embed?mid=z2NCe4lIOjVA.kgQgTDLLMHfw">Google Maps</a>]
<!-- <iframe src="https://www.google.com/maps/d/u/0/embed?mid=z2NCe4lIOjVA.kgQgTDLLMHfw" width="80%" height="90%"></iframe> -->
<iframe frameborder="0" width="100%" height="85%" src="http://bl.ocks.org/d/$share"></iframe> <br/>
<small>&#169; <a href="https://www.facebook.com/NCXAntioquia">NCX Antioquia</a>
</center>
EOF
