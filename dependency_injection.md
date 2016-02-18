Dependency Injection

- Basic idea is that a class should be responsible for one thing only. It should not be responsible for other
  things like connecting to databases. One can regain control of the class and instead pass in the database connection. Two ways to accomplish this: constructor and setter injection, respectively.

  Constructor Injection -- injecting all required dependencies when the class's constructor method runs

'```
class Photo {
  protected $db;

  public function __construct($dbConn) {
    $this->db = $dbConn;
  }
}

$photo = new Photo($dbConn);
```

  Setter Injection -- Class is no longer dependent upon any specific connection. Outside system retains complete control. This makes it easier to test the class as one can now mock the database, when calling the setDB method.
```
  class Photo {
    protected $db;

    public function __construct() {}

    public function setDB($dbConn) {
      $this->db = $dbConn;
    }
  }

  $photo = new Photo;
  $photo->setDB($dbConn);
```

Dependency Injection is where components are given their dependencies through their constructors, methods, or directly into fields.

- The main issue with setter injection is that it makes the class materially more difficult to work with. User
  must now be fully aware of the dependencies and must remember to set them. 

- The solution to this problem is to create a container class that will handle the brunt of work for us
  (Inversion of Control). IoC is a OO programming practice where the object coupling is bound at run time by 
  an assembler object and is typically not known at compile time.The class will store a registry of all the 
  dependencies for our project. Each key will have an associated lambda function that instantiates the associated class.

```
  class IoC {
    protected $db;

    public static newPhoto() {
      $photo = new Photo;
      $photo->setDB(static::$db);
        // $photo->setConfig();
        // $photo->setResponse();
      return $photo
    }
  }

  $photo = IoC::newPhoto();
```

$photo will equal a new instance of the Photo class with all the required dependencies set. This way, the user
does not have to remember to set these dependencies manually; he simply calls the newPhoto method.

```
  class IoC {
    protected static $registry = array();

    public static function register($name, Closure $resolve) {
      static::$registry[$name] = $resolve;
    }

    public static function resolve($name) {
      if ( static::registered($name) ) {
        $name = static::$registry[$name];
        return $name();
      }

      throw new Exception('Nothing registered with that name');
    }

    public static function registered($name) {
      return array_key_exists($name, static::$registry);
    }
  }
```

- When the user calls the IoC::register method, they are adding an id, such as photo, and its associated
  resolver, which is just a lambda that creates the instance and sets any necessary dependencies on the class.
  We can register and resolve dependencies through the IoC class:
  ```
    IoC::register('photo', function() {
      $photo = new Photo;
      $photo->setDB('...');
      $photo->setConfig('...');

      return $photo;
    });

    $photo = IoC::resolve('photo');

- Not manually instantiating the class, instead we register it, and then request a specific instance. Reduces
  complexity when we stripped the hardcoded dependencies out of the class. Virtually the same number of 
  characters, but now the class is significantly more flexible and testable. In real-world usage, you would likely
  want to extend this class to allow for the creation of singletons.
