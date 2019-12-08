import 'dart:async';
import 'dart:convert';

class NewsApi{

  Future <List> loadNews() async{

    String json = "[  \n" +
        "   {  \n" +
        "      \"id\":\"1\",\n" +
        "      \"tittle\":\"Notícia 1 \",\n" +
        "      \"url_img\":\"https://picsum.photos/250?image=1\",\n" +
        "      \"link\":\"Descricao qualquer\",\n" +
        "      \"origin\":\"siteorigem.com\",\n" +
        "      \"category\":\"noticia\",\n" +
        "      \"date\":\"2019-02-22 11:11:11\"\n" +
        "   },\n" +
        "   {  \n" +
        "      \"id\":\"2\",\n" +
        "      \"tittle\":\"Notícia 2 \",\n" +
        "      \"url_img\":\"https://picsum.photos/250?image=2\",\n" +
        "      \"link\":\"Descricao qualquer\",\n" +
        "      \"origin\":\"siteorigem.com\",\n" +
        "      \"category\":\"noticia\",\n" +
        "      \"date\":\"2019-02-22 11:11:11\"\n" +
        "   },\n" +
        "   {  \n" +
        "      \"id\":\"3\",\n" +
        "      \"tittle\":\"Notícia 3 \",\n" +
        "      \"url_img\":\"https://picsum.photos/250?image=3\",\n" +
        "      \"link\":\"Descricao qualquer\",\n" +
        "      \"origin\":\"siteorigem.com\",\n" +
        "      \"category\":\"noticia\",\n" +
        "      \"date\":\"2019-02-22 11:11:11\"\n" +
        "   },\n" +
        "   {  \n" +
        "      \"id\":\"4\",\n" +
        "      \"tittle\":\"Notícia 4 \",\n" +
        "      \"url_img\":\"https://picsum.photos/250?image=4\",\n" +
        "      \"link\":\"Descricao qualquer\",\n" +
        "      \"origin\":\"siteorigem.com\",\n" +
        "      \"category\":\"noticia\",\n" +
        "      \"date\":\"2019-02-22 11:11:11\"\n" +
        "   },\n" +
        "   {  \n" +
        "      \"id\":\"5\",\n" +
        "      \"tittle\":\"Notícia 5 \",\n" +
        "      \"url_img\":\"https://picsum.photos/250?image=5\",\n" +
        "      \"link\":\"Descricao qualquer\",\n" +
        "      \"origin\":\"siteorigem.com\",\n" +
        "      \"category\":\"noticia\",\n" +
        "      \"date\":\"2019-02-22 11:11:11\"\n" +
        "   },\n" +
        "   {  \n" +
        "      \"id\":\"6\",\n" +
        "      \"tittle\":\"Notícia 6\",\n" +
        "      \"url_img\":\"https://picsum.photos/250?image=6\",\n" +
        "      \"link\":\"Descricao qualquer\",\n" +
        "      \"origin\":\"siteorigem.com\",\n" +
        "      \"category\":\"noticia\",\n" +
        "      \"date\":\"2019-02-22 11:11:11\"\n" +
        "   },\n" +
        "   {  \n" +
        "      \"id\":\"7\",\n" +
        "      \"tittle\":\"Notícia 7\",\n" +
        "      \"url_img\":\"https://picsum.photos/250?image=7\",\n" +
        "      \"link\":\"Descricao qualquer\",\n" +
        "      \"origin\":\"siteorigem.com\",\n" +
        "      \"category\":\"noticia\",\n" +
        "      \"date\":\"2019-02-22 11:11:11\"\n" +
        "   }\n" +
        "]";

    return jsonDecode(json);

  }

}