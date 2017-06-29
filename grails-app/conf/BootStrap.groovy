import br.ufscar.dc.mvp.User
import br.ufscar.dc.mvp.Role
import br.ufscar.dc.mvp.UserRole

class BootStrap {

    def init = { servletContext ->

        if (!Role.list()) {
            new Role(authority: "ROLE_ADMIN").save flush: true  /* Administrador */
            new Role(authority: "ROLE_SLSMN").save flush: true  /* Vendedor */

            log.debug "Roles: DONE"
        }

        if (!User.list()) {
            def admin = new User (
                    username: "admin",
                    password: "root",
                    email: "admin@mvp.br",
                    firstName: "Administrador",
                    lastName: " MVP",
                    enabled: true
            )
            admin.save flush: true

            UserRole.create admin, Role.findByAuthority("ROLE_ADMIN"), true
            UserRole.create admin, Role.findByAuthority("ROLE_SLSMN"), true

            log.debug "Users: DONE"
        }

        log.debug "Bootstrap: DONE"

    }

    def destroy = {
    }
}
