alias db="docker build -t sss ."
alias dr="docker run --rm -p 8000:8000 -it sss"
alias dcb="docker-compose build"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dcl="docker-compose logs -f"


function generateCert {
	# https://letsencrypt.org/docs/certificates-for-localhost/
	# https://github.com/jwilder/nginx-proxy
	echo "Creating cert for ${1}";

	DOMAIN=$1;
	KEY="${DOMAIN}.key";
	CRT="${DOMAIN}.crt";
	ENCRYPT="rsa:2048"; #"rsa:2048";"4096"
	SUBJ="/CN=${DOMAIN}";
	CONFIG="[dn]\nCN=${DOMAIN}\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:${DOMAIN}\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth";

	#openssl req -x509 -sha256 -out $CRT -keyout $KEY -newkey $ENCRYPT -nodes -sha256 -subj $SUBJ -extensions EXT -config <(printf $CONFIG);
	#openssl req -x509 -sha256 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365
}




echo 'commands have been sourced'
