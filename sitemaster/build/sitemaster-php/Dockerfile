FROM almalinux:8.7

RUN dnf install -y \
    #mod_ssl \
    epel-release \
    gd \
    gd-devel \
    httpd \
    perl \
    php \
    php-devel \
    php-mbstring \
    php-mysqlnd \
 && dnf --enablerepo=epel install -y \
    ImageMagick \
    supervisor

# Perl
RUN dnf --enablerepo=epel,powertools install -y \
    perl-Archive-Extract \
    perl-Archive-Tar \
    perl-BSD-Resource \
    perl-CGI \
    perl-CPAN \
    perl-Cache-Cache \
    perl-Cache-Memcached \
    perl-Carp-Always \
    perl-Class-Singleton \
    perl-Compress-Raw-Bzip2 \
    perl-Compress-Raw-Zlib \
    perl-Compress-Zlib \
    perl-Crypt-DES \
    perl-Crypt-SSLeay \
    perl-DBD-MySQL \
    perl-DBD-Pg \
    perl-DBD-SQLite \
    perl-DBI \
    perl-DBIx-Simple \
    perl-Date-Manip \
    perl-DateTime \
    perl-Digest-HMAC \
    perl-Digest-SHA \
    perl-Digest-SHA1 \
    perl-Email-Date-Format \
    perl-Error \
    perl-Excel-Writer-XLSX \
    perl-ExtUtils-CBuilder \
    perl-ExtUtils-Embed \
    perl-ExtUtils-MakeMaker \
    perl-ExtUtils-ParseXS \
    perl-FCGI \
    perl-File-Copy-Recursive \
    perl-File-Fetch \
    perl-GD-Barcode \
    perl-Git \
    perl-HTML-Parser \
    perl-HTML-Tagset \
    perl-HTML-Template \
    perl-IO-Compress-Base \
    perl-IO-Compress-Bzip2 \
    perl-IO-Compress-Zlib \
    perl-IO-Multiplex \
    perl-IO-Socket-INET6 \
    perl-IO-Zlib \
    perl-IPC-Cmd \
    perl-IPC-ShareLite \
    perl-Jcode \
    perl-LWP-Protocol-https \
    perl-List-MoreUtils \
    perl-Locale-Maketext-Simple \
    perl-Log-Dispatch \
    perl-Log-Dispatch-FileRotate \
    perl-Log-Log4perl \
    perl-MIME-Lite \
    perl-MIME-Types \
    perl-MIME-tools \
    perl-Mail-Sender \
    perl-Mail-Sendmail \
    perl-MailTools \
    perl-Module-Build \
    perl-Module-CoreList \
    perl-Module-Load \
    perl-Module-Load-Conditional \
    perl-Module-Loaded \
    perl-Module-Pluggable \
    perl-Net-CIDR \
    perl-Net-DNS \
    perl-Net-IP \
    perl-Net-SNMP \
    perl-Net-SSLeay \
    perl-Net-Server \
    perl-Object-Accessor \
    perl-Package-Constants \
    perl-Params-Check \
    perl-Params-Validate \
    perl-Pod-Escapes \
    perl-Pod-Simple \
    perl-Socket6 \
    perl-String-CRC32 \
    perl-Taint-Runtime \
    perl-Test-Harness \
    perl-Test-Simple \
    perl-Time-HiRes \
    perl-Time-Piece \
    perl-TimeDate \
    perl-URI \
    perl-Unicode-UTF8 \
    perl-XML-DOM \
    perl-XML-Dumper \
    perl-XML-LibXML \
    perl-XML-NamespaceSupport \
    perl-XML-Parser \
    perl-XML-RegExp \
    perl-XML-SAX \
    perl-XML-Simple \
    perl-XML-Twig \
    perl-YAML-Syck \
    perl-core \
    perl-devel \
    perl-libs \
    perl-libwww-perl \
    perl-libxml-perl \
    perl-parent \
    perl-version \
    ImageMagick-perl \
 && dnf clean all

RUN cpan install \
    Unicode::Japanese

RUN mkdir -p /run/php-fpm \
 && sed -ri \
    -e 's!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g' \
    -e 's!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g' \
    /etc/httpd/conf/httpd.conf

COPY vhosts.conf /etc/httpd/conf.d/
COPY 00-php.ini /etc/php.d/
COPY supervisord.ini /etc/supervisord.d/

CMD ["/usr/bin/supervisord"]
