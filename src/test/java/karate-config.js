function fn() {
  var env = karate.env; // get system property 'karate.env'
  var baseURLReqRes='';

  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }

  if (env == 'dev') {
    baseURLReqRes='https://petstore.swagger.io';
  } else if (env == 'cert') {
     baseURLReqRes='https://petstore.swagger.io.ert';
  }
    var config = {
      env: env,
      baseURLReqRes:baseURLReqRes,
      myVarName: 'someValue'
    }


  return config;
}

/*
function fn() {
  var env = karate.env; // get system property 'karate.env'
  var baseURL='';
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}
*/