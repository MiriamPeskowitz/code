import React, { Component } from 'react';
import { connect } from 'react-redux';
import { simpleAction } from './actions/simpleAction';
import './App.css';


class App extends Component {
  
 simpleAction = (event) => {
    this.props.simpleAction();
  }

  render() {
    return (
      <div className="App">
        <h1> test render</h1>
         <pre>
          {
            JSON.stringify(this.props)
          }
        </pre>
        <button onClick={()=>{ alert('alert'); }}>alert</button>
        <button onClick={this.simpleAction}> Test Redux Action </button>
       
       
      </div>
    );
  }
}
const mapStateToProps = state => ({
  ...state
})

const mapDispatchToProps = dispatch => ({
  simpleAction: () => dispatch(simpleAction())
})

export default connect(mapStateToProps, mapDispatchToProps)(App);
