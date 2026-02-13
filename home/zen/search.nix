{ pkgs, ... }: {
  force = true;
  default = "kagi";
  privateDefault = "ddg";
  engines = {
    "kagi" = {
      definedAliases = [ "kagi" ];
      urls = [
        {
          template = "https://kagi.com/search";
	  params = [
	    {
	      name = "q";
	      value = "{searchTerms}";
	    }
	  ];
	}
      ];
    };
    "ddg" = {
      definedAliases = [ "duck" "ddg" ];
      urls = [
        {
          template = "https://duckduckgo.com";
	  params = [
	    {
	      name = "q";
	      value = "{searchTerms}";
	    }
	    {
	      name = "origin";
	      value = "your_butt";
	    }
	  ];
	}
      ];
    };
  };
}
