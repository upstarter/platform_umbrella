const heroStyles = {
  hero: {
    minHeight: '61.8vh',
    '-webkit-background-clip': 'padding-box', /* for Safari */
    backgroundClip: 'padding-box', /* for IE9+, Firefox 4+, Opera, Chrome */
    background: 'linear-gradient(to bottom, rgba(14,19,27, .85), rgba(14,19,27, .75)), url(\'/images/hero.jpg\') no-repeat',
    backgroundRepeat: 'no-repeat',
    position: 'relative',
    backgroundSize: '100% 100%',
    color: 'white',
    '& .title': { color: 'white' },

    '& .hero-body': {
      padding: '11rem 6rem 6rem',
      textAlign: 'center',
      '& .container': {
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
      },
      '& .subtitle-big': {
        maxWidth: '300rem',
        marginTop: '15px',
      },
      '& .title': {
        maxWidth: '90rem',
        marginLeft: '-10%',
      },

      '& .title2': {
        maxWidth: '90rem',
      },
    },

    '& .email-leadgen': {
      fontSize: '3rem',

      '& .button-control,& button': {
        // background: 'transparent',
        fontawesomeize: '1.8rem !important',
      },

      '& .button-control:hover': {
        transform: 'translateY(-.2rem)',
      },

      '& .button-control:active': {
        transform: 'translateY(-.1rem)',
      },

      '& .control': {
        marginBottom: '1rem',
        marginLeft: '.3rem',

        '& input': {
          fontSize: '1.6rem',
        },


        '& .select,& select': {
          width: '100%',
        }
      },

      '& .success-message': {
        textAlign: 'center',

        '@media (min-width: 576px)': {
          padding: '1rem 0',
        },

        '& .fa': {
          color:' #783D6F',
          fontSize: '5rem',
          marginBottom: '1rem',
          paddingTop: '1rem',
        },

        '& h2': {
          fontSize: '14px',
          marginBottom: '1rem',
        }
      }
    }
  },
}
export default heroStyles;
