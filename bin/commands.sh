alias db="docker build -t sss ."
alias dr="docker run --rm -p 8000:8000 -it sss"
alias dcb="docker-compose build"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dcl="docker-compose logs -f"

function generateCert {
	# https://letsencrypt.org/docs/certificates-for-localhost/
	# https://medium.freecodecamp.org/how-to-get-https-working-on-your-local-development-environment-in-5-minutes-7af615770eec
	echo "Creating cert for ${1}";

	DOMAIN=$1;
	KEY="${DOMAIN}.key";
	CRT="${DOMAIN}.crt";
	ENCRYPT="rsa:2048";
	SUBJ="/CN=${DOMAIN}";
	CONFIG="[dn]\nCN=${DOMAIN}\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:${DOMAIN}\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth";

	openssl req -x509 -sha256 -out $CRT -keyout $KEY -newkey $ENCRYPT -nodes -sha256 -subj $SUBJ -extensions EXT -config <(printf $CONFIG);
}
