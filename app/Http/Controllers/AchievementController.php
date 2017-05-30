<?php 
namespace App\Http\Controllers;
use App\Achievement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
class AchievementController extends Controller{

	public function index(){
		$achievements = achievement::all();
		return response()->json(['data' => $achievements], 200);
	}

	//store data achievement
	public function store(Request $request){
		$this->validateRequest($request);
		$achievement = achievement::create([
			'name' => $request->get('name'),
			'exp' => $request->get('exp'),
			'type' => $request->get('type'),
			'threshold' => $request->get('threshold'),
			'threshold_type' => $request->get('threshold_type')

			]);
		return response()->json(['data' => "The achievement with with id {$achievement->id} has been created"], 201);
	}
	

	//show data achievement
	public function show($id){
		//achievement profile & achievement
		$achievement = achievement::with('achievements')->find($id);
	
		//error message
		if(!$achievement){
			return response()->json(['message' => "The achievement with {$id} doesn't exist"], 404);
		}
		//return achievement
		return response()->json(['data' => $achievement], 200);
	}

	//edit data achievement
	public function update(Request $request, $id){
		$achievement = achievement::find($id);
		if(!$achievement){
			return response()->json(['message' => "The achievement with {$id} doesn't exist"], 404);
		}
		$this->validateRequest($request);
		$achievement->name        = $request->get('name');
		$achievement->exp        = $request->get('exp');
		$achievement->type       = $request->get('type');
		$achievement->threshold  = $request->get('threshold');
		$achievement->threshold_type = $request->get('threshold_type');


		$achievement->save();
		return response()->json(['data' => "The achievement with with id {$achievement->id} has been updated"], 200);
	}

	//delete data achievement
	public function destroy($id){
		$achievement = achievement::find($id);
		if(!$achievement){
			return response()->json(['message' => "The achievement with {$id} doesn't exist"], 404);
		}
		$achievement->delete();
		return response()->json(['data' => "The achievement with with id {$id} has been deleted"], 200);
	}

	public function validateRequest(Request $request){
		$rules = [
		'name' => 'required', 
		'exp' => 'required',
		'type' => 'required',
		'threshold' => 'required',
		'threshold_type' => 'required'
		];
		$this->validate($request, $rules);
	}
}