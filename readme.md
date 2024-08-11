ReconSleuth

ReconSleuth is a powerful and easy-to-use Bash script designed for domain reconnaissance. It allows users to perform WHOIS lookups, DNS record checks, and SSL certificate analysis, all in one simple command-line tool.

Features

- WHOIS Lookup: Retrieve WHOIS information about a domain.
- DNS Records Check: Gather details about a domain's DNS records, including A, NS, MX, and TXT records.
- SSL Certificate Check: Examine the SSL certificate of a domain to gather information about its validity, issuer, and subject.

Prerequisites

- Bash: Make sure you have Bash installed (default in most Unix-based systems).
- cURL: Required for DNS record checks.
- jq: A lightweight and flexible command-line JSON processor, needed for parsing DNS results.
- OpenSSL: Required for checking SSL certificates.

To install any missing dependencies on a Debian-based system like Kali Linux, run:

bash
	sudo apt-get install curl jq openssl

Installation

Clone the repository to your local machine:

bash

	git clone https://github.com/yourusername/ReconSleuth.git
	cd ReconSleuth

Make the script executable:

bash

	chmod +x recontool.sh

Usage

Run the script with the appropriate options:

bash

	./recontool.sh [OPTIONS]

Available Options

    -d, --domain : Specify the target domain (e.g., -d google.com).
    -w, --whois : Perform a WHOIS lookup on the specified domain.
    -n, --dns : Check the DNS records of the specified domain.
    -s, --ssl : Check the SSL certificate information of the specified domain.
    -h, --help : Display the help message.

Example Usages

    WHOIS Lookup and DNS Records:

    bash

	./recontool.sh -d google.com -w -n

This command will perform a WHOIS lookup and retrieve DNS records for google.com.

SSL Certificate Check:

bash

    ./recontool.sh -d google.com -s

    This command will check the SSL certificate for google.com.

Contributing

Contributions are welcome! If you'd like to contribute, please fork the repository and use a feature branch. Pull requests are warmly welcome.
License


