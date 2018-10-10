
Vue.use(VueMarkdown);


Vue.component('kp-article', {
    template: `
    <article>
        <a class="btn btn-primary text-white" @click="$emit('back')">
            &laquo; Go back
        </a>
        <div>
            <a :href="article.html_url" title="View on GitHub" class="d-inline">
                <i class="fab fa-2x fa-github mr-1 my-3"></i>
            </a>
            <h2 class="d-inline">{{ article.title }}</h4>
        </div>
        <p>
            <vue-markdown>{{ article.body }}</vue-markdown>
        </p>
    </article>
    `,
    props: ['article']
});

Vue.component('kp-card', {
    template: `
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">
                {{ title }}
            </h4>
            <p class="card-text">
                <slot></slot>
            </p>
            <a class="btn btn-primary text-white" @click="$emit('selected')">
                {{ buttonText || 'Read more &raquo;' }}
            </a>
        </div>
    </div>
    `,
    props: ['title', 'buttonText']
});

const articlesUrl = 'https://api.github.com/repos/KillahPotatoes/KP-Liberation/issues?state=all&labels=dev-blog';

new Vue({
    delimiters: ['${', '}'], // change delimeters so we don't conflict with Liquid
    el: '#news',
    data() {
        return {
            articles: [],
            currentArticle: null,
            error: false
        };
    },
    mounted() {
        this.fetchArticles();
    },
    methods: {
        fetchArticles() {
            console.log('fetching articles');
            fetch(articlesUrl)
                .then(x => x.json())
                .then(x => this.articles = x)
                .catch(_ => this.error = true);

        }
    }
});
