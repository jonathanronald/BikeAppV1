<?php 
namespace App\Http\Controllers;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
class UserController extends Controller{

	public function index(){
		$users = User::all();
		return response()->json(['data' => $users], 200);
	}

	//store data user
	public function store(Request $request){
		$this->validateRequest($request);
		$user = User::create([
			'email' => $request->get('email'),
			'password'=> Hash::make($request->get('password'))
			]);
		return response()->json(['data' => "The user with with id {$user->id} has been created"], 201);
	}

	//show data user
	public function show($id){
		//user profile & achievement
		$user = User::with('achievements')->find($id);
	
		//error message
		if(!$user){
			return response()->json(['message' => "The user with {$id} doesn't exist"], 404);
		}
		//return user
		return response()->json(['data' => $user], 200);
	}

	//edit data user
	public function update(Request $request, $id){
		$user = User::find($id);
		if(!$user){
			return response()->json(['message' => "The user with {$id} doesn't exist"], 404);
		}
		$this->validateRequest($request);
		$user->email        = $request->get('email');
		$user->password     = Hash::make($request->get('password'));
		$user->save();
		return response()->json(['data' => "The user with with id {$user->id} has been updated"], 200);
	}

	//delete data user
	public function destroy($id){
		$user = User::find($id);
		if(!$user){
			return response()->json(['message' => "The user with {$id} doesn't exist"], 404);
		}
		$user->delete();
		return response()->json(['data' => "The user with with id {$id} has been deleted"], 200);
	}

	public function validateRequest(Request $request){
		$rules = [
		'email' => 'required|email|unique:users', 
		'password' => 'required|min:6'
		];
		$this->validate($request, $rules);
	}
}