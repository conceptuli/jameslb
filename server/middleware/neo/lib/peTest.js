/*
var nlp = require('nlp_compromise')
var s= nlp.pos("every cat has a tail.").sentences[0]

console.log(s.tags())
console.log(nlp.spot("every cat has a tail."))
*/
var nlp = {};
nlp.getParse = function(text, callback)
{
  if (text.length >250)
  {
    return false; //"ERROR: input length greater than 250 characters. Please parse one sentence at a time";
  }
  else
  {
    var url = 'http://nlp.naturalparsing.com/api/parse?input=?format=json&jsoncallback='+encodeURIComponent(callback)+'&input=' + encodeURIComponent(text) +"&version=0.1&options=sentence";
/*    var script = document.createElement("script");
    script.setAttribute("async", "true");
    script.setAttribute("src", url);
    script.setAttribute("type", "text/javascript");

    document.body.appendChild(script);*/
    return true;
  }
};

nlp.getParsedTree = function(text, callback)
{
  if (text.length >250)
  {
    return false; //"ERROR: input length greater than 250 characters. Please parse one sentence at a time";
  }
  else
  {
    var url = 'http://nlp.naturalparsing.com/api/parse?input=?format=json&jsoncallback='+encodeURIComponent(callback)+'&input=' + encodeURIComponent(text) +"&version=0.1&options=tree";

    return;
  }
};

nlp.JSONtoString = function(data)
{
  if (data.words == null )
  {
    return;
  }
  else
  {
    var x;
    var output = "";
    for (x in data.words)
    {
      output = output + data.words[x].value + "/" + data.words[x].tag + " ";
    }
    return output
  }
};

module.exports = nlp
