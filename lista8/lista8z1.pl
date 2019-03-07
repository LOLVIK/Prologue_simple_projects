:- use_module([library(sgml), library(xpath), library(url)]).

goals(LoadedHtml, Host) :-
	   xpath(LoadedHtml, //a(@href), Url) ,
           parse_url(Url, localhost, UrlTable),
           %is_absolute_url(Url),
           member(host(Host), UrlTable).

serwery(NazwaPliku, ListaSerwerow) :-
    load_html(NazwaPliku, LoadedHtml, []),
   %xpath(LoadedHtml, //a(@href), ListaSerwerow),
    setof(Host,
         goals(LoadedHtml,Host),
          ListaSerwerow).
