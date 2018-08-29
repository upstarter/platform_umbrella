import React, { Component } from "react";
import Answer from "./Answer";
import Question from "./Question";
import Timer from "./Timer";
import ProgressBar from "./ProgressBar";
import Result from "./Result";

export default class Quiz extends Component {
  constructor(props) {
    super(props);
    let quiz = this.props.quiz;
    this.state = {
      step: 0,
      title: quiz.quizTitle,
      questions: quiz.questions,
      currentQuestion: quiz.questions[0],
      answers: [],
      correctAns: [],
      totalQuestions: quiz.questions.length,
      endQuiz: false,
      showResult: false
    };
    this.handleClick = this.handleClick.bind(this);
    this.parseCorrectAnswer();
  }
  parseCorrectAnswer() {
    const { correctAns, questions } = this.state;
    questions.map(question => {
      return correctAns.push(question.correctAnswer);
    });
  }
  handleClick = index => {
    console.log(index);
    const { step, questions, answers, totalQuestions } = this.state;
    answers.push(index + 1);
    let updatedStep = step;

    if (step < totalQuestions - 1) {
      updatedStep = step + 1;
      this.setState({
        step: updatedStep,
        currentQuestion: questions[updatedStep]
      });
    } else {
      this.setState({
        endQuiz: true
      });
    }
  };
  render() {
    const {
      title,
      questions,
      currentQuestion,
      answers,
      correctAns,
      endQuiz
    } = this.state;

    return (
      <div>
        <Question currentQuestion={currentQuestion} />
        {endQuiz === true ? (
          <div>
            <Answer
              questionType={currentQuestion.questionType}
              answers={currentQuestion.answers}
              handleClick={this.handleClick}
              renderInResult={false}
            />
            <Timer countdown={20} />
            <ProgressBar currentQuestion={1} questionCount={5} />
          </div>
        ) : (
          <div>
            <Result
              questions={questions}
              answers={answers}
              correctAns={correctAns}
            />
          </div>
        )}
      </div>
    );
  }
}
