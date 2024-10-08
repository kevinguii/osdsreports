% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/render_national.R
\name{render_national}
\alias{render_national}
\title{Render a National Report}
\usage{
render_national(df, shp, country_name, year)
}
\arguments{
\item{df}{A data frame provided}

\item{shp}{A shape file}

\item{country_name}{A string of the name of the country}

\item{year}{A numeric specifying year}

\item{output_file}{Path to save the rendered document}
}
\value{
renders a single national report for the given country
}
\description{
Given a data frame containing population data (df), the
name of the country (country_name), and the year (yr), return a single
national report based on the given parameters
}
\examples{
render_national(country_data,adm0_shpae,"USA",2017)


}
\author{
Kevin Gui
}
