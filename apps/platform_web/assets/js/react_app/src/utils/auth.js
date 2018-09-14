const isBrowser = typeof window !== `undefined`

const getUser = () =>
    window.localStorage.cryptowiseUser ?
    JSON.parse(window.localStorage.cryptowiseUser) : {}

const setUser = user => (window.localStorage.cryptowiseUser = JSON.stringify(user))

export const handleLogin = ({
    email,
    password
}) => {
    if (!isBrowser) return false

    if (email === `cryptowise@gmail.com` && password === `demo`) {
        console.log(`Credentials match! Setting the active user.`)
        return setUser({
            name: `demoUser`,
            legalName: `DemoName`,
            email,
        })
    }

    return false
}

export const isLoggedIn = () => {
    if (!isBrowser) return false

    const user = getUser()

    return !!user.email
}

export const getCurrentUser = () => isBrowser && getUser()

export const logout = callback => {
    if (!isBrowser) return

    console.log(`Ensuring the \`cryptowiseUser\` property exists.`)
    setUser({})
    callback()
}