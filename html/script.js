const target =
    document.getElementById('target')

const options =
    document.getElementById('options')

window.addEventListener('message', function(event) {

    const data = event.data

    if (data.action === 'show') {

        target.style.opacity = '1'
    }

    if (data.action === 'hide') {

        target.style.opacity = '0'

        target.classList.remove('hover')

        options.classList.remove('visible')

        options.innerHTML = ''
    }

    if (data.action === 'hover') {

        if (data.state) {

            target.classList.add('hover')
        }
        else {

            target.classList.remove('hover')

            options.classList.remove('visible')

            options.innerHTML = ''
        }
    }

    if (data.action === 'options') {

        options.innerHTML = ''

        if (!data.options ||
            data.options.length === 0) {

            options.classList.remove('visible')

            return
        }

        data.options.forEach((option, index) => {

            const div =
                document.createElement('div')

            div.className = 'option'

            div.dataset.index = index

            div.innerHTML = `

                <span>${option.icon || '•'}</span>

                <span>${option.label}</span>
            `

            div.addEventListener('mouseenter', () => {

                document
                    .querySelectorAll('.option')
                    .forEach(option => {

                        option.classList.remove(
                            'active'
                        )
                    })

                div.classList.add('active')
            })

            div.addEventListener('mouseleave', () => {

                div.classList.remove('active')
            })

            div.addEventListener('click', () => {

                fetch(`https://${GetParentResourceName()}/selectOption`, {

                    method: 'POST',

                    headers: {

                        'Content-Type': 'application/json'
                    },

                    body: JSON.stringify({

                        index: index
                    })
                })
            })

            options.appendChild(div)
        })

        options.classList.add('visible')
    }
})

document.addEventListener('keydown', function(event) {

    if (event.key === 'Escape') {

        fetch(`https://${GetParentResourceName()}/closeTarget`, {

            method: 'POST',

            headers: {

                'Content-Type': 'application/json'
            },

            body: JSON.stringify({})
        })
    }
})