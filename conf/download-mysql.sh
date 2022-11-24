set -ex

LIB_HOME=$1
MYSQL_URL="https://repo.maven.apache.org/maven2/mysql/mysql-connector-java/8.0.13/mysql-connector-java-8.0.13.jar"
MYSQL_DRIVER="mysql-connector-java-8.0.13.jar"

# ensure the curl command been installed
if ! command -v curl &> /dev/null; then
    apt update -y && apt install -y curl
fi

if ! curl -Lo "${LIB_HOME}/${MYSQL_DRIVER}" ${MYSQL_URL}; then
    echo "Fail to download ${MYSQL_DRIVER}."
    exit 1
fi
