package br.ufscar.dc.mvp

import org.springframework.security.core.GrantedAuthority

class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	String email
	String firstName
	String lastName
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	User(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	@Override
	int hashCode() {
		username?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof User && other.username == username)
	}

	@Override
	String toString() {
		username
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		email blank: false, email: true, unique: true
		firstName blank: false
		lastName blank: true
	}

	static mapping = {
		password column: '`password`'
	}

	String getName () {
		return firstName + " " + lastName
	}

	HashSet<GrantedAuthority> authoritiesHashSet() {
		def roles = UserRole.findAllByUser(this).collect { it.role }
		def auths = new HashSet<GrantedAuthority>()
		roles.each { role ->
			def auth = new GrantedAuthority() {

				@Override
				String getAuthority() {
					return role.authority
				}
			}
			auths.add(auth)

		} as Set<Role>
		return auths
	}
}
