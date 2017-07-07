class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
   

        "/"(view:"/index")
        "500"(view:'/error')
        
        // API mappings
        "/produto/add"(controller: "produto", action: "adicionaProduto")
	}
}
