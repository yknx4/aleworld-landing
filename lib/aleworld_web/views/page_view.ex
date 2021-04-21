defmodule AleworldWeb.PageView do
  use AleworldWeb, :view

  @languages [
    [lang: "Korean", level: "A2", progress: 0.3],
    [lang: "Japanese", level: "A1", progress: 0.15],
    [lang: "English", level: "C1", progress: 0.95],
    [lang: "Spanish", level: "Native", progress: 1.0]
  ]

  @projects [
    [
      title: "Publicity.ai",
      year: "2018",
      stack: [
        "React",
        "Rails",
        "Koa",
        "Elixir",
        "Phoenix",
        "AWS",
        "Heroku",
        "Elasticsearch",
        "PostgreSQL",
        "ECS"
      ],
      link: "https://publicity.ai/",
      repo: nil,
      description: """
      """
    ],
    [
      title: "Progressly",
      year: "2016",
      stack: ["React", "Rails", "ExpressJS", "Elastic Search", "AWS", "PostgreSQL"],
      link: "https://web.archive.org/web/20171020143426/https://www.progressly.com/",
      repo: nil,
      description: """
      """
    ],
    [
      title: "Beanstack",
      year: "2016",
      stack: ["AngularJS 1", "Rails", "PostgreSQL", "Heroku"],
      link: "https://www.beanstack.com/",
      repo: nil,
      description: """
      """
    ]
  ]

  @school [
    [
      location: "Universidad de Colima",
      title: "Bachelors Degree",
      major: "Software Engineering",
      start: "2012",
      finish: "2016",
      gpa: (9.4 * 4 / 10) |> Float.round(2) |> to_string()
    ],
    [
      location: "고려대학교 (Korea University)",
      title: "Exchange Student Program",
      major: "Computer Science",
      start: "2015",
      finish: "2015",
      gpa: (9.86 * 4 / 10) |> Float.round(2) |> to_string()
    ]
  ]

  @experience [
    [
      location: "AMV",
      position: "Devops Engineer",
      start: "May 2018",
      finish: "May 2021",
      tasks: [
        "Lead Manager of the project infrastructure under both Heroku and Amazon Web Services",
        "Setup of Auto-Scaling and rolling deployments with Elastic Container Service",
        "Setup of CI/CD Pipelines for all the infrastructure using CircleCI",
        "Setup of E2E testing with Cypress",
        "Migration of Auth infrastructure from Rails/Devise to Keycloak for company-wide authentication",
        "Setup of the search backend using ElasticSearch",
        "Backend: Migration of speed critical code from Ruby/Rails to Elixir/Phoenix",
        "Backend: Microservices stack for web crawling and analysis from scratch in NodeJS",
        "Backend: Migration of certain crawling tasks from NodeJS/Express to AWS Lambda for high scalability"
      ]
    ],
    [
      location: "Progressly (Acquired by Box)",
      position: "Software Engineer",
      start: "Dec 2016",
      finish: "May 2018",
      tasks: [
        "Devops: 2nd in charge of the project infrastructure",
        "Devops: Continous Deployment to Amazon Web Services",
        "Devops: CI Migration from Codeship to CircleCI",
        "Devops: E2E Testing setup with Cypress",
        "Devops: Setup of the search backend using ElasticSearch",
        "Backend: Leader of the full migration from Rails to NodeJS/Express",
        "Backend: Development of a Slack bot for company internal tasks, including ACL, DB Management, Deployment, and Testing"
      ]
    ],
    [
      location: "Zoobean",
      position: "Full Stack Developer",
      start: "Feb 2016",
      finish: "Nov 2016",
      tasks: [
        "Front End Development in AngularJS 1.0",
        "Backend Development in Rails 4",
        "Database Admin and Manteninance in PostgreSQL 9.2",
        "Performance Analysis and Manteinance with NewRelic and Scout"
      ]
    ],
    [
      location: "MagmaLabs",
      position: "Software Engineer",
      start: "Feb 2016",
      finish: "May 2016",
      tasks: [
        "Contractor work for Zoobean",
        "Rails 4/5",
        "Javascript",
        "AngularJS",
        "PostgreSQL"
      ]
    ],
    [
      location: "MagmaLabs",
      position: "Software Engineer Intern",
      start: "Feb 2016",
      finish: "May 2016",
      tasks: [
        "Front End Development Training in AngularJS",
        "Backend Development Training in Rails"
      ]
    ]
  ]

  @devops_skills [
    "Docker",
    "Docker Compose",
    "Git",
    "CI/CD",
    "CircleCI",
    "AWS",
    "ECS",
    "EC2",
    "Heroku",
    "PaaS",
    "Linux",
    "OSX",
    "Windows"
  ]

  @backend_skills [
    "NodeJS",
    "Javascript",
    "Typescript",
    "ExpressJS",
    "Koa",
    "NextJS",
    "Ruby",
    "Rails",
    "Elixir",
    "Phoenix",
    "PostgreSQL",
    "SQLite",
    "Elasticsearch",
    "DynamoDB",
    "Redis",
    "Memcached",
    "AWS S3",
    "Keycloak",
    "MySQL",
    "AWS RDS",
    "OpenAPI",
    "Serverless"
  ]

  @frontend_skills [
    "React",
    "Redux",
    "Webpack",
    "HTML",
    "Bootstrap",
    "TailwindCSS",
    "Electron",
    "Jest",
    "Cypress"
  ]

  @languages_skills [
    "Native Spanish", "Fluid English (C1)", "Basic Korean (A2)", "Basic Japanese (A1)"
  ]

  def experience, do: @experience
  def school, do: @school
  def projects, do: @projects
  def languages, do: @languages
  def devops_skills, do: @devops_skills
  def backend_skills, do: @backend_skills
  def frontend_skills, do: @frontend_skills
  def languages_skills, do: @languages_skills

  def skill_tag(skill) do
    content_tag :li, skill, class: "px-2.5 mr-1.6 mb-1 text-gray-200 leading-relaxed print:bg-white print:border-inset bg-gray-250"
  end

  def header_link(opts) do
    title = Keyword.fetch!(opts, :title)
    text = Keyword.fetch!(opts, :text)
    to = Keyword.fetch!(opts, :to)

    content_tag(:li,
      class:
        "mt-1 leading-normal text-black transition duration-100 ease-in text-gray-550 text-md hover:text-gray-700 print:"
    ) do
      link(to: to, class: "group", target: "_blank") do
        [
          content_tag(:span, "#{title}:",
            class: "mr-2 text-lg font-semibold text-gray-700 leading-snugish"
          ),
          text,
          content_tag(:span, "↗",
            class:
              "inline-block font-normal text-black transition duration-100 ease-in text-gray-550 print:text-black group-hover:text-gray-700 print:"
          )
        ]
      end
    end
  end

  def language_block(opts) do
    lang = Keyword.fetch!(opts, :lang)
    level = Keyword.fetch!(opts, :level)

    content_tag :section, class: "m-0.5 w-1/4 pb-4 mb-4 break-inside-avoid " do
      [
        content_tag(:div, class: "bg-gray-400 text-white p-2 rounded  leading-none flex items-center") do
          [lang, content_tag(:div, level, class: "bg-white p-1 rounded text-gray-700 text-xs ml-2")]
        end
      ]
    end
  end

  def project_block(opts) do
    title = Keyword.fetch!(opts, :title)
    year = Keyword.fetch!(opts, :year)
    stack = Keyword.fetch!(opts, :stack)
    link = Keyword.fetch!(opts, :link)
    description = Keyword.get(opts, :description)

    content_tag :section, class: "pb-4 mb-4 border-b-2 break-inside-avoid" do
      [
        content_tag(:header) do
          [
            content_tag(:h3, class: "text-lg font-semibold text-gray-700 leading-snugish") do
              link(to: link, class: "group", target: "_blank") do
                [
                  title,
                  content_tag(:span, "↗",
                    class:
                      "inline-block mr-3 font-normal transition duration-100 ease-in text-gray-550 print:text-black group-hover:text-gray-700"
                  )
                ]
              end
            end,
            content_tag(:p, "#{year} | #{stack |> Enum.join(", ")}",
              class: "leading-normal text-md text-gray-550"
            )
          ]
        end,
        content_tag(:p, description, class: "mt-2.1 text-md text-gray-700 leading-normal")
      ]
    end
  end

  def education_block(opts) do
    location = Keyword.fetch!(opts, :location)
    title = Keyword.fetch!(opts, :title)
    start = Keyword.fetch!(opts, :start)
    finish = Keyword.fetch!(opts, :finish)
    major = Keyword.fetch!(opts, :major)
    gpa = Keyword.fetch!(opts, :gpa)

    content_tag :section, class: "pb-4 mt-4 mb-4 border-b-2 break-inside-avoid" do
      [
        content_tag(:header) do
          [
            content_tag(:h3, location,
              class: "flex-grow text-lg font-semibold text-gray-700 leading-snugish"
            ),
            content_tag(:p, "#{start} - #{finish} | #{title}",
              class: "leading-normal text-md text-gray-550"
            )
          ]
        end,
        content_tag :p, class: "mt-1 leading-normal text-md text-gray-650" do
          [
            content_tag(:span, "Major: ",
              class: "font-semibold text-gray-700 text-md leading-snugish"
            ),
            major
          ]
        end,
        content_tag :p, class: "leading-normal text-gray-700 text-md" do
          [
            content_tag(:span, "GPA: ",
              class: "font-semibold text-gray-700 text-md leading-snugish"
            ),
            gpa
          ]
        end
      ]
    end
  end

  def experience_block(opts) do
    location = Keyword.fetch!(opts, :location)
    position = Keyword.fetch!(opts, :position)
    start = Keyword.fetch!(opts, :start)
    finish = Keyword.fetch!(opts, :finish)
    tasks = Keyword.fetch!(opts, :tasks)

    content_tag :section, class: "mb-2 break-inside-avoid border-b-2" do
      [
        content_tag :header do
          [
            content_tag(:h3, position,
              class: "text-lg font-semibold text-gray-650 leading-snugish"
            ),
            content_tag(:p, "#{start} - #{finish} | #{location}", class: "leading-normal text-md text-gray-550")
          ]
        end,
        content_tag :ul, class: "mt-2.1 text-md text-gray-700 leading-normal" do
          tasks |> Enum.map(&experience_tag/1)
        end
      ]
    end
  end

  def experience_tag(task) do
    content_tag :li do
      [
        content_tag(:span, raw("&rsaquo; "),
          class: "transform -translate-y-px select-none text-gray-550"
        ),
        task
      ]
    end
  end
end
